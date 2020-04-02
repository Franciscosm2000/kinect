
%%prueba coneccion de kinect y da informacion
hwInfo = imaqhwinfo ( 'kinect' )
%%acceso a la camara
hwInfo.DeviceInfo(1)
colorVid = videoinput('kinect' , 1,'RGB_640x480')
preview(colorVid);
% 
%         %%Camara de profundidad
% hwInfo.DeviceInfo(2)
% depthVid = videoinput( 'kinect' , 2,'Depth_640x480')
%         %%caputura imagen de la camara de profundidad
% %%depthImage = getsnapshot(depthVid)
% %%imshow(depthImage)
% triggerconfig ([colorVid depthVid], 'manual' )
% % colorVid.FramesPerTrigger = 100
% % depthVid.FramesPerTrigger = 100
% % start([colorVid depthVid])
% % trigger([colorVid depthVid])
% % 
% % [colorFrameData, colorTimeData, colorMetaData] = getdata(colorVid)
% % [depthFrameData, depthTimeData, depthMetaData] = getdata(depthVid)
% % 
% % stop ([colorVid depthVid])
% depthSrc = getselectedsource (depthVid)
% %%depthSrc.TrackingMode = 'Skeleton'
% 
% colorVid.FramesPerTrigger = 100
% depthVid.FramesPerTrigger = 100
% 
% start ([colorVid depthVid])
% trigger ([colorVid depthVid])
% 
% [frameDataColor] = getdata (colorVid)
% [frameDataDepth, timeDataDepth, metaDataDepth] = getdata (depthVid)
% 
% metaDataDepth
% 
% anyPositionsTracked = any(metaDataDepth(95).IsPositionTracked ~= 0)
% anySkeletonsTracked = any(metaDataDepth(95).IsSkeletonTracked ~= 0)
% 
% trackedSkeletons = find(metaDataDepth(95).IsSkeletonTracked)
% 
% jointCoordinates = metaDataDepth(95).JointWorldCoordinates(:, :, trackedSkeletons)
% % Skeleton's joint indices with respect to the color image
% jointIndices = metaDataDepth(95).JointImageIndices(:, :, trackedSkeletons)
% 
% % Pull out the 95th color frame
% image = frameDataColor(:, :, :, 95)
% 
% % Find number of Skeletons tracked
% nSkeleton = length(trackedSkeletons)
% 
% % Plot the skeleton
% util_skeletonViewer(jointIndices, image, nSkeleton);
