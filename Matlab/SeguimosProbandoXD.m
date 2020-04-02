%%Hacemos referencia al kinect
hwInfo = imaqhwinfo ( 'kinect' )
%%Elejimos el kinect
hwInfo.DeviceInfo(1)
hwInfo.DeviceInfo(2)
%%Camaras
colorVid = 	videoinput( 'kinect' , 1,'RGB_640x480')
depthVid = videoinput( 'kinect' , 2,'Depth_640x480')
%%Adquirimos datos de profundida
%%Activamos en modo manual 
triggerconfig ([colorVid depthVid], 'manual' )
%%Especificamos a 100 frames por segundo 
colorVid.FramesPerTrigger = 100
depthVid.FramesPerTrigger = 100
%%damos inicio al proceso 
start([colorVid depthVid])
%%Activa los dispositivos para inicar el registro de los datos 
trigger([colorVid depthVid]);
    %%preview(colorVid)
%%Recuperamos los datos
[colorFrameData,colorTimeData,colorMetaData] = getdata(colorVid)
%%[depthFrameData,depthTimeData,depthMetaData] = getdata(depthVid)
%%Detemos el dispositivo 
stop([colorVid depthVid])












% 
%     %%No funciona por la versiion 
% %%octenemos el objeto del video source
% depthSrc = getselectedsource(depthVid)
% %%Activa el seguimiento esqueletico
% depthSrc.TrackingMode = 'Skeleton'
% %%Adquiere 100 fotogramas
% colorVid.FramesPerTrigger = 100 
% depthVid.FramesPerTrigger = 100
% 
% start([colorVid depthVid]);
% trigger([colorVid depthVid]);
% 
% % Recupere los marcos y compruebe si se siguen los esqueletos 
% [frameDataColor] = getdata(colorVid);
% [frameDataDepth, timeDataDepth, metaDataDepth] = getdata(depthVid)
% 
% %%ve los metadatos a profundidad
% metaDataDepth
% 
% %%Verificar esqueletos rastreados desde metadatos de profundidad 
% anyPositionsTracked = any(metaDataDepth(95).IsPositionTracked ~= 0)
% anySkeletonsTracked = any(metaDataDepth(95).IsSkeletonTracked ~= 0)
% %%se
% trackedSkeletons = find(metaDataDepth(95).IsSkeletonTracked)
% %%se
% jointCoordinates = metaDataDepth(95).JointWorldCoordinates(:, :, trackedSkeletons)
% jointIndices = metaDataDepth(95).JointImageIndices(:, :, trackedSkeletons)
% 
% % Pull out the 95th color frame
% image = frameDataColor(:, :, :, 95)
% 
% % Find number of Skeletons tracked
% nSkeleton = length(trackedSkeletons)
% 
% % Plot the skeleton
% util_skeletonViewer(jointIndices, image, nSkeleton)
% 
