clc
m = 1;
M = 5;
L = 2;
g = -10;
d = 1;
%u = zeros(6,1);
%% pole placement
%eigs = [-15;-5;-2;-4;-7;-1];
%[14.9456  483.9787 -323.3340   32.2753  57.8164    1.4369];
%%
tspan = 0:.02:10;
i = 1:1:501;
x0 = [-1; pi/2; pi/2; 0;0;0;];
d = [1; pi; pi; 0; 0; 0];
u=@(x) -K*(x - d);
[t,x] = ode45(@(t,x)pendcart(x,u(x),i),tspan,x0);

for i = 1:length(t)
 dx(i,:) = pendcart(x(i,:),u(x(i)));
end





% figure(1)
% subplot(3,1,1)
% plot(t,rad2deg(x(:,3)));
% xlabel('Time in secs')
% ylabel('Position of first Pendulam')
% hold on
% 
% subplot(3,1,2)
% plot(t,rad2deg(x(:,2)));
% xlabel('Time in secs')
% ylabel('Position of second Pendulam')
% 
% 
% subplot(3,1,3)
% plot(t,x(:,1));
% xlabel('Time in secs')
% ylabel('Position of cart')
% sgtitle('Positions for Cart and pendulum for LQR')
% set(gcf, 'PaperUnits', 'inches');
% x_width=7.25 ;y_width=9.125;
% set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
% saveas(gcf,'position_LQR_E4.png')
% hold off
% 
% figure(3)
% 
% subplot(3,1,1)
% plot(t,rad2deg(x(:,5)));
% xlabel('Time in secs')
% ylabel('Velocity of first Pendulam')
% hold on
% 
% subplot(3,1,2)
% plot(t,rad2deg(x(:,6)));
% xlabel('Time in secs')
% ylabel('Velocity of second Pendulam')
% 
% 
% subplot(3,1,3)
% plot(t,x(:,4));
% xlabel('Time in secs')
% ylabel('Velocity of cart')
% sgtitle('Velocity for Cart and pendulum for LQR')
% set(gcf, 'PaperUnits', 'inches');
% x_width=7.25 ;y_width=9.125;
% set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
% saveas(gcf,'Velocity_LQR_E4.png')
% hold off
% 
% 
% figure(4)
% subplot(3,1,1)
% plot(t,(dx(:,5)));
% xlabel('Time in secs')
% ylabel('Acceleration of first Pendulam')
% hold on
% 
% subplot(3,1,2)
% plot(t,(dx(:,6)));
% xlabel('Time in secs')
% ylabel('Acceleration of second Pendulam')
% 
% 
% subplot(3,1,3)
% plot(t,dx(:,4));
% xlabel('Time in secs')
% ylabel('Acceleration of cart')
% sgtitle('Accelerations for Cart and pendulum for LQR')
% set(gcf, 'PaperUnits', 'inches');
% x_width=7.25 ;y_width=9.125;
% set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
% saveas(gcf,'Accelerations_LQR_E4.png')
% hold off
% 

% figure(5)
% 
% subplot(3,1,1)
% plot(t,x(:,1));
% xlabel('Time in secs')
% ylabel('Position of cart')
% hold on
% %
% subplot(3,1,2)
% plot(t,x(:,4));
% xlabel('Time in secs')
% ylabel('Velocity of cart')
% %sgtitle('Velocity for Cart and pendulum for LQR')
% sgtitle(F)
% 
% subplot(3,1,3)
% plot(t,dx(:,4));
% xlabel('Time in secs')
% ylabel('Acceleration of cart')
% 
% set(gcf, 'PaperUnits', 'inches');
% x_width=7.25 ;y_width=9.125;
% set(gcf, 'PaperPosition', [0 0 x_width y_width]); %
% saveas(gcf,F1)
% hold off




%t,x] = ode45(@(t,x)pendcart(x,u(x),tspan,x0));
%%
myVideo = VideoWriter('Video_LQR_E3');
myVideo.FrameRate = 30;
open(myVideo)
for k=1:length(t)
    drawpend(x(k,:));
    pause(0.01)
    frame = getframe(gcf);
    writeVideo(myVideo,frame);
end
close(myVideo);


% function dy = pendcart(y,m,M,L,g,d,u)

