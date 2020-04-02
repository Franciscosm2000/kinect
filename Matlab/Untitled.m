imaqreset;
%create color and depth kinect videoinput objects
colourVid = videoinput('kinect', 1,'RGB_640x480');
depthVid = videoinput('kinect', 2, 'Depth_640x480');
triggerconfig (depthVid,'manual');
depthVid.FramesPerTrigger=1
depthVid.TriggerRepeat=inf;
src = getselectedsource(depthVid);
src.EnableBodyTracking = 'on';
%set (getselectedsource(depthVid), 'TrackingMode', 'Skeleton')
% viewer = vision.DeployableVideoPlayer();
start(depthVid);
himg = figure
while ishandle(himg);
    trigger (depthVid);
    [depthMap, ~, depthMetaData] = getdata (depthVid);
    imshow (depthMap, [0 4096]);
    if  sum(depthMetaData.IsBodyTracked) >0
          skeletonJoints = depthMetaData.DepthJointIndices (:,:,depthMetaData.IsBodyTracked);
          hold on;
          plot (skeletonJoints(:,1), skeletonJoints(:,2),'*-');
          hold off;
    end
end
stop(depthVid);