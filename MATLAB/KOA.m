
% ----------------------- README ------------------------------------------
%   Author and programmer: Reda Mohamed & Mohamed Abdel-Basset
%   Main paper:
%               Kepler optimization algorithm: A new metaheuristic algorithm
%               inspired by Kepler laws of planetary motion
% -------------- 最后一次修改：2023/1/3 -----------------------------------
% -------------------  欢迎关注₍^.^₎♡  ------------------------------------
% -------------- 项目：Kepler optimization algorithm (KOA) ----------------
% -------------- 微信公众号：KAU的云实验台(可咨询定制) --------------------
% -------------- CSDN：KAU的云实验台 --------------------------------------
% -------------- 付费代码(更全)：https://mbd.pub/o/author-a2iWlGtpZA== ----
% -------------- 免费代码：公众号后台回复"资源" ---------------------------
% -------------------------------------------------------------------------

% The Kepler Optimization Algorithm 再注释版

function [Convergence_curve,Sun_Score,Sun_Pos]=KOA(SearchAgents_no,Tmax,ub,lb,dim,fobj)

%% 定义
Sun_Pos=zeros(1,dim); % 太阳
Sun_Score=inf;
Convergence_curve=zeros(1,Tmax);

%% 控制参数
Tc=3; %a2中的参数
M0=0.1; % 引力中u的计算参数
lambda=15;% 引力中u的计算参数

%% 1.1 初始化
orbital=rand(1,SearchAgents_no); %偏心率
T=abs(randn(1,SearchAgents_no)); % 轨道周期
Positions=initialization(SearchAgents_no,dim,ub,lb);

% 适应度
for i=1:SearchAgents_no
    PL_Fit(i)=fobj(Positions(i,:));
    if PL_Fit(i)<Sun_Score
        Sun_Score=PL_Fit(i);
        Sun_Pos=Positions(i,:);
    end
end

%% 时间推移
t=0;
while t<Tmax

    [Order] = sort(PL_Fit);

    worstFitness = Order(SearchAgents_no);
    M=M0*(exp(-lambda*(t/Tmax))); % u(t)

    % 行星与太阳的欧氏距离
    for i=1:SearchAgents_no
        R(i)=0;
        for j=1:dim
            R(i)=R(i)+(Sun_Pos(j)-Positions(i,j))^2;
        end
        R(i)=sqrt(R(i));
    end

    % 太阳与行星质量
    for i=1:SearchAgents_no
        sum=0;
        for k=1:SearchAgents_no
            sum=sum+(PL_Fit(k)-worstFitness);
        end
        MS(i)=rand*(Sun_Score-worstFitness)/(sum);
        m(i)=(PL_Fit(i)-worstFitness)/(sum);
    end


    %% 引力
    for i=1:SearchAgents_no
        Rnorm(i)=(R(i)-min(R))/(max(R)-min(R)); %% The normalized R (Eq.(24))
        MSnorm(i)=(MS(i)-min(MS))/(max(MS)-min(MS)); %% The normalized MS
        Mnorm(i)=(m(i)-min(m))/(max(m)-min(m)); %% The normalized m
        Fg(i)=orbital(i)*M*((MSnorm(i)*Mnorm(i))/(Rnorm(i)*Rnorm(i)+eps))+(rand); %% Eq.(6)
    end

    %% a1 表示椭圆轨道的半长轴
    for i=1:SearchAgents_no
        a1(i)=rand*(T(i)^2*(M*(MS(i)+m(i))/(4*pi*pi)))^(1/3); %% Eq.(23)
    end

    for i=1:SearchAgents_no

        %% a2 循环控制参数
        a2=-1+-1*(rem(t,Tmax/Tc)/(Tmax/Tc)); %% Eq.(29)

        %% ? is a linearly decreasing factor from 1 to ?2
        n=(a2-1)*rand+1; %% Eq.(28)
        a=randi(SearchAgents_no);  %% An index of a solution selected at random
        b=randi(SearchAgents_no); %% An index of a solution selected at random
        sd=rand(1,dim); %% A vector generated according to the normal distribution
        s=rand; %% r1 is a random number in [0,1]

        %% A randomly-assigned binary vector
        U1=sd<s; %% Eq.(21)
        O_P=Positions(i,:); %% Storing the current position of the ith solution

        if rand<rand
            %% Step 6: Updating distance with the Sun 更新和太阳的距离
            %% h is an adaptive factor for controlling the distance between the Sun and the current planet at time t
            h=(1/(exp(n.*randn))); %% Eq.(27)

            %% An verage vector based on three solutions: the Current solution, best-so-far solution, and randomly-selected solution
            Xm=(Positions(b,:)+Sun_Pos+Positions(i,:))/3.0;
            Positions(i,:)=Positions(i,:).*U1+(Xm+h.*(Xm-Positions(a,:))).*(1-U1); %% Eq.(26)

        else

            %% Step 3: Calculating an object� velocity 计算行星速度
            % A flag to opposite or leave the search direction of the current planet
            if rand<0.5 %% Eq.(18)
                f=1;
            else
                f=-1;
            end
            L=(M*(MS(i)+m(i))*abs((2/(R(i)+eps))-(1/(a1(i)+eps))))^(0.5); %% Eq.(15)
            U=sd>rand(1,dim); %% A binary vector
            if Rnorm(i)<0.5 %% Eq.(13)
                M=(rand.*(1-s)+s); %% Eq.(16)
                l=L*M*U; %% Eq.(14)
                Mv=(rand*(1-sd)+sd); %% Eq.(20)
                l1=L.*Mv.*(1-U);%% Eq.(19)
                V(i,:)=l.*(2*rand*Positions(i,:)-Positions(a,:))+l1.*(Positions(b,:)-Positions(a,:))+(1-Rnorm(i))*f*U1.*rand(1,dim).*(ub-lb); %% Eq.(13a)
            else
                U2=rand>rand; %% Eq. (22)
                V(i,:)=rand.*L.*(Positions(a,:)-Positions(i,:))+(1-Rnorm(i))*f*U2*rand(1,dim).*(rand*ub-lb);  %% Eq.(13b)
            end %% End IF

            %% Step 4: Escaping from the local optimum 逃出局部最优
            % Update the flag f to opposite or leave the search direction of the current planet
            if rand<0.5 %% Eq.(18)
                f=1;
            else
                f=-1;
            end
            %% Step 5 更新天体位置
            Positions(i,:)=((Positions(i,:)+V(i,:).*f)+(Fg(i)+abs(randn))*U.*(Sun_Pos-Positions(i,:))); %% Eq.(25)
        end %% End If

        %% Return the search agents that exceed the search space's bounds 边界规范
        if rand<rand
            for j=1:size(Positions,2)
                if  Positions(i,j)>ub(j)
                    Positions(i,j)=lb(j)+rand*(ub(j)-lb(j));
                elseif  Positions(i,j)<lb(j)
                    Positions(i,j)=lb(j)+rand*(ub(j)-lb(j));
                end %% End If
            end   %% End For
        else
            Positions(i,:) = min(max(Positions(i,:),lb),ub);
        end %% End If

        PL_Fit1=fobj(Positions(i,:));
        %  Step 7: Elitism
        if PL_Fit1<PL_Fit(i) % Change this to > for maximization problem
            PL_Fit(i)=PL_Fit1; %
            % Update the best-so-far solution
            if PL_Fit(i)<Sun_Score % Change this to > for maximization problem
                Sun_Score=PL_Fit(i); % Update the best-so-far score
                Sun_Pos=Positions(i,:); % Update te best-so-far solution
            end
        else
            Positions(i,:)=O_P;
        end %% End IF
        t=t+1; %% Increment the current function evaluation
        if t>Tmax %% Checking the termination condition
            break;
        end %% End IF
        Convergence_curve(t)=Sun_Score;
    end %% End for i
     %% Set the best-so-far fitness value at function evaluation t in the convergence curve

end %% End while
% Convergence_curve(t-1)=Sun_Score;
Convergence_curve(t-1)=Sun_Score;
end%% End Function


