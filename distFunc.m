function dist = distFunc(horizontalDistance,verticalDistance,originalDistance)
    % ��������ֱ����ģ��ˮƽ�봹ֱ����ĸı䣬���Ҳ�����ˮƽ�봹ֱ����ı���Ҫת�ĳ���
    R = 200;
    theta1 = 7/360*2*pi; % ֱ���½�
    theta2 = 11/360*2*pi; % �����½�
    if(verticalDistance-horizontalDistance*tan(theta1)<0)
        %L*tan(theta1)
        dist = originalDistance;
        return;
    end
    C = (verticalDistance-horizontalDistance*tan(theta1))/(2*pi*R*tan(theta2));
    h1 = horizontalDistance/cos(theta1); % ֱ�߳���
    h2 = C*2*pi*R/cos(theta2); % ��������
    dist = h1+h2;
end