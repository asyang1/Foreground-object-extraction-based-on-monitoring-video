clear;
frame = imread('D:\��ѧ��ģ\����\data\question4\hall\pre-picture\pre-picture1.jpg'); 
imshow(frame);
% hold on;
 for i = 1:36
     for j = 1 : 22 
         if i==1
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
             hold on;
         end
          if j==1
             frame(i,j) = 0;
              plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
              hold on;
          end
          if i==36
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
             hold on;
          end
          if j==22
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
             hold on;
         end
     end
 end
  
 for i = 37:72
     for j = 1 : 22 
         if i==37
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
         end
          if j==1
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
          end
          if i==72
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
          end
          if j==22
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
         end
     end
 end
  
 for i = 73:144
     for j = 1 : 44
         if i==73
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
         end
          if j==1
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
          end
          if i==144
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
          end
          if j==44
             frame(i,j) = 0;
             plot(j,i,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
         end
     end
 end
%  plot(76,76,'co','MarkerSize',10,'MarkerSize',5,'MarkerEdgeColor','c','MarkerFaceColor','c');
 imshow(frame);title('ͼƬ�ָ������Сʾ��');
% % bar(cell2mat(result(:,3+18)));



% DIR='D:\��ѧ��ģ\����\data\question5\modified\';        %ͼƬ�����ļ���
% file=dir(strcat(DIR,'*.jpg'));                %��ȡ����jpg�ļ�
% filenum=size(file,1);                         %ͼƬ����
% result = zeros(filenum,1);
% for num = 1:filenum 
%     flag = 0;
%     fname = strcat(DIR, num2str(num), '.jpg');
%     frame = imread(fname); 
%     [r,v] = size(frame);
%     for i = 1:r
%         for j = 1:v
%             if frame(i,j) ~=0
%                flag = flag +1;
%             end
%         end
%     end
%     result(num,1) =flag;    
% end
% 
% bar(result);title('ViBe�㷨������ͼƬ���ص�������֡���ı仯')
%     
