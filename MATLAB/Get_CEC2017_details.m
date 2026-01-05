
% ----------------------- README ------------------------------------------
% -------------- 最后一次修改：2023/11/24 ---------------------------------
% -------------------  欢迎关注₍^.^₎♡  ------------------------------------
% -------------- 项目：CEC测试函数合集  -----------------------------------
% -------------- 微信公众号：KAU的云实验台(可咨询定制) ---------------------
% -------------- CSDN：KAU的云实验台 --------------------------------------
% -------------- 付费代码：https://mbd.pub/o/author-a2iWlGtpZA== ----------
% -------------- 免费代码：公众号后台回复"资源" ---------------------------
% -------------------------------------------------------------------------

function [lb,ub,dim,fobj] = Get_CEC2017_details(F,dim)


switch F
    case 'F1'
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',1); 
        
    case 'F2'   % 被删
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',2); 
        
    case 'F3'
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',3); 
        
    case 'F4' 
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',4); 
        
    case 'F5'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',5); 
        
        
    case 'F6'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',6); 
        
    case 'F7'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',7); 
        
    case 'F8'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',8); 
        
    case 'F9'
      
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',9); 
        
    case 'F10'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',10); 
        
    case 'F11'

        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',11); 
        
    case 'F12'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',12); 
        
    case 'F13'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',13); 
        
    case 'F14'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',14); 
        
    case 'F15'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',15); 
        
    case 'F16'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',16); 
        
    case 'F17'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',17); 
        
    case 'F18'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',18); 
        
    case 'F19'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',19); 
        
        
    case 'F20'
      
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',20); 
        
        
    case 'F21'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',21); 
        
    case 'F22'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',22); 
        
    case 'F23'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',23); 
        
    case 'F24'

        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',24); 
        
    case 'F25'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',25); 
    case 'F26'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',26); 
    case 'F27'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',27); 
    case 'F28'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',28); 
    case 'F29'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',29); 
    case 'F30'
        
        lb=-100*ones(1,dim);
        ub=100*ones(1,dim);
        fobj = @(x) cec17_func(x',30); 
        
end

end
