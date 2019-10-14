function [dis,dirX,dirY] = CircleAndStraight(xA,yA,xADir,yADir,xB,yB,origin)
    R = 200;
    len = sqrt(yADir^2+xADir^2);
    xbDir1 = yADir/len;ybDir1 = -xADir/len;
    xbDir2 = -yADir/len;ybDir2 = xADir/len;
    xCir1 = xA+R*xbDir1;yCir1 = yA+R*ybDir1;
    xCir2 = xA+R*xbDir2;yCir2 = yA+R*ybDir2;
    
%     alpha = atan(yA/xA);
%     alpha1 = alpha-pi/2;alpha2 = alpha+pi/2;
%     xCir1 = xA+R*cos(alpha1);yCir1 = yA+R*sin(alpha1);
%     xCir2 = xA+R*cos(alpha2);yCir2 = yA+R*sin(alpha2);
    % �õ�Բ��
    if(((xB-xCir1)^2+(yB-yCir1)^2)<((xB-xCir2)^2+(yB-yCir2)^2))
        xCir = xCir1;yCir = yCir1;
    else
        xCir = xCir2;yCir = yCir2;
    end
    if(sqrt((xB-xCir)^2+(yB-yCir)^2)<R)
        % ����С��R������
        dis = +inf;dirX = 0;dirY = 0;
        return
    end
    
    Rlarge = sqrt((xB-xCir)^2+(yB-yCir)^2);
    
% �㵽Բ�ľ����ƽ��
 d2 = ( xB - xCir ) * ( xB - xCir ) + ( yB - yCir ) * ( yB - yCir );
% �㵽Բ�ľ���
 d = sqrt( d2 );
% �뾶��ƽ��
 r2 = R * R;

% �㵽�е����
 l = sqrt( d2 - r2 );
% ��->Բ�ĵĵ�λ����
 x0 = ( xCir - xB ) / d;
 y0 = ( yCir - yB ) / d;
% ����������������ߵļн�
 f = asin( R / d );
% ����������������ת��λ����
 x1 = x0 * cos( f ) - y0 * sin( f );
 y1 = x0 * sin( f ) + y0 * cos( f );
 x2 = x0 * cos( -f ) - y0 * sin( -f );
 y2 = x0 * sin( -f ) + y0 * cos( -f );
% �õ�������
x_1 = x1*l+xB;%( x1 + xB ) * l;
y_1 = y1*l+yB;%( y1 + yB ) * l;
x_2 = x2*l+xB;%( x2 + xB ) * l;
y_2 = y2*l+yB;%( y2 + yB ) * l;
    
    
%     syms x y;
%     [x,y]=solve((x-xCir)^2+(y-yCir)^2-R^2,(x-xB)^2+(y-yB)^2-Rlarge^2);
%     
    if((xADir*(x_1-xA)+yADir*(y_1-yA))/sqrt((xA-x_1)^2+(yA-y_1)^2)>(xADir*(x_2-xA)+yADir*(y_2-yA))/sqrt((xA-x_2)^2+(yA-y_2)^2))
        % �ڻ��������cos�󣬽Ƕ�С
       xE = x_1;yE = y_1; 
    else
        xE = x_2;yE = y_2; 
%     else
%         here = 1;
    end
        
    % ���ҳ��õ�������ʽ������=2arcsin(�ҳ�/2r)*r
    xian = sqrt((xA-xE)^2+(yA-yE)^2);
    hu = 2*asin(xian/(2*R))*R;
    % ȫ��Ϊhu+B E����
    dis = hu + sqrt((xB-xE)^2+(yB-yE)^2);% AE����
    dirX = xB-xE;dirY = yB-yE;

end