function drawpend(state)
x = state(1);
th = state(2);
th2 = state(3);

M = 5;
L = 1;

% dimensions
W = 1*sqrt(M/5);  % cart width
H = .5*sqrt(M/5); % cart height
wr = .2;          % wheel radius
mr = .3*sqrt(.5);  % mass radius

% positions
y = wr/2+H/2; % cart vertical position
pendx = x + L*sin(th);
pendy = y - L*cos(th);
pendx2 = pendx + L*sin(th2);%x + L*sin(th+(pi/10));
pendy2 = pendy - L*cos(th2); %y - L*cos(th+(pi/10));

figure(2)
plot([-10 10],[0 0],'k','LineWidth',2), hold on
rectangle('Position',[x-W/2,y-H/2,W,H],'Curvature',.1,'FaceColor',[.5 1 1],'LineWidth',1.5); % Draw cart

rectangle('Position',[x-.9*W/2,0,wr,wr],'Curvature',1,'FaceColor',[0 0 0],'LineWidth',1.5); % Draw wheel
rectangle('Position',[x+.9*W/2-wr,0,wr,wr],'Curvature',1,'FaceColor',[0 0 0],'LineWidth',1.5); % Draw wheel

plot([x pendx],[y pendy],'k','LineWidth',2); % Draw pendulum
rectangle('Position',[pendx-mr/2,pendy-mr/2,mr,mr],'Curvature',1,'FaceColor',[1 .9 .1],'LineWidth',1.5);
plot([pendx pendx2],[pendy pendy2],'k','LineWidth',2); % Draw pendulum2
%plot([pendx pendx2+mr],[pendy pendy2],'k','LineWidth',2); % Draw pendulum2
plot(pendx2, pendy2, '.r', 'MarkerSize',20)
%rectangle('Position',[pendx2-mr-.2,pendy2-mr+.2,mr,mr],'Curvature',1,'FaceColor',[1 .5 1],'LineWidth',1.5);%pendulam2 blob
%plot([0 .5], [1 2]) & x ,  w h

axis([-5 5 -5 5]); axis equal

%set(gcf,'Position',[100 100 1000 400])
drawnow
hold off
