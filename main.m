%%
%Our Algorithm consist of 4 different subtraction method.
%1. Simple Background Subtraction <Simple_Background_Sub.m>
%2. Simple Frame Difference <simple_frame_difference.m>
%3. Adaptive Background Subtraction <Adaptive_BG_sub.m>
%4. Persistent Frame Differencing <persistent_frame_diff.m>

clc;clear;
%%
vid_names = ["ArenaA.mp4","ArenaN.mp4","ArenaW.mp4","getin.mp4","getout.mp4","movecam.mp4","trees.mp4","walk.mp4"];

for vid = 1:8
    vid_name = char(vid_names(vid));
    output_vid_name = char(strcat('output_',vid_name));
    v = VideoReader(vid_name);
    length = v.NumberOfFrames;
    %create video writer
    vid_output = VideoWriter(output_vid_name);
    open(vid_output);
    
    img_Simple_Background_subtraction = Simple_Background_subtraction(vid_name);
    img_Simple_frame_difference = Simple_frame_difference(vid_name);
    img_Adaptive_background_subtraction = Adaptive_background_subtraction(vid_name);
    img_Persistent_frame_difference = Persistent_frame_difference(vid_name);
    
    for i = 1:length
        img1 = img_Simple_Background_subtraction(i,:,:);
        img1 = squeeze(img1);
        
        img2 = img_Simple_frame_difference(i,:,:);
        img2 = squeeze(img2);
        
        img3 = img_Adaptive_background_subtraction(i,:,:);
        img3 = squeeze(img3);
        
        img4 = img_Persistent_frame_difference(i,:,:);
        img4 = squeeze(img4);
        
        result = [img1 img2; img3 img4];
        writeVideo(vid_output,result);
    end
    close(vid_output);
end
    