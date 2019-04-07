[~,~,~,~,~,~,~,~,flat5,flat6]=body60('L',0);
A = [1, 2, 0.2  ];
[X1, Y1, ~] = vturn(flat5(:,1,:), flat5(:,2,:), flat5(:,3,:), [0 0 1], A);
flat5(:,1,:) = X1; flat5(:,2,:) = Y1; flat5(:,3,:) = 0;
[X1, Y1, ~] = vturn(flat6(:,1,:), flat6(:,2,:), flat6(:,3,:), [0 0 1], A);
flat6(:,1,:) = X1; flat6(:,2,:) = Y1; flat6(:,3,:) = 0;
draw_football(flat5,flat6);
