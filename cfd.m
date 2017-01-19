
close all;
clc;
clear;

cd('C:\Users\DkShorti\Desktop\CFD')
%%
vidObj = VideoReader('v2.mp4');
vidHeight = vidObj.Height;
vidWidth = vidObj.Width;

s = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'),...
    'colormap',[]);

%%
k = 1;
i = 1;
while hasFrame(vidObj)
    s(i).cdata = readFrame(vidObj);
    if(mod(k, 5) == 0)        
        i = i+1;
    end
    k = k+1;
end

image=zeros(vidHeight,vidWidth,3); %initialize

% img_R=zeros(vidHeight,vidWidth,k-1); 
% img_G=zeros(vidHeight,vidWidth,k-1); 
% img_B=zeros(vidHeight,vidWidth,k-1); 

%%
for itr=1:size(s,2)
     img_R(:,:,itr) = s(itr).cdata(:, :, 1);
     img_G(:,:,itr) = s(itr).cdata(:, :, 2);
     img_B(:,:,itr) = s(itr).cdata(:, :, 3);
end 

%%
image(:, :, 1) = median(img_R, 3);
image(:, :, 2) = median(img_G, 3);
image(:, :, 3) = median(img_B, 3);

figure;
imshow(image./255)

for i = 1:size(s,2)
    imshow(img_G(:, :, i))
end

% 
% for channel=1:3
%     for width=1:vidWidth
%         for height=1:vidHeight
%             for itr=1:k-1
%                 img_R(width, height, i) = s(i).cdata(width, height, channel);
%         end
%     end
% end
% 
% imshow(image)