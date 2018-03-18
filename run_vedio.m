%��Ƶ����
clear;
clc;

video=VideoReader('highway_gray.avi');     %��ȡ��Ƶ�ļ�
vidFrames = read(video);                   % ��ȡ��Ƶ����������
numFrames = get(video, 'numberOfFrames');  %�����Ƶ֡��֡��

%����Ƶ֡�����д���һ��MATLAB��Ƶ���Žṹ��
  for k = 1 : numFrames
         mov(k).cdata = vidFrames(:,:,:,k);
         mov(k).colormap = [];
  end   
  hf=figure;                               %����ͼ��
  %������Ƶ�Ŀ�Ⱥ͸߶��ؽ�ͼƬ
  set(hf, 'position', [150 150 video.Width video.Height])
  %������Ƶ֡�����ز���Ƶ
  movie(hf, mov, 1, video.FrameRate);