DIR='D:\��ѧ��ģ\����\data\question5\pre-picture\';        %ͼƬ�����ļ���
fname = strcat(DIR, '3.jpg');
pre = imread(fname);
fname = strcat(DIR, '97.jpg');
aft = imread(fname);
DIR='D:\��ѧ��ģ\����\data\question5\modified\';        %ͼƬ�����ļ���
fname = strcat(DIR, '3.jpg');
modified = imread(fname);
fname = strcat(DIR, '97.jpg');
result = imread(fname);

% [r,v] = size(modified);
% % for  i = 1:r
% %     for j = 1:v
% %         if i>60 && i<240 && j >110&&j<180
% %            continue;
% %         else 
% %             modified(i,j) = 0;
% %         end
% %     end
% % end
% result = pre;
% for  i = 1:r
%     for j = 1:v
%         if modified(i,j) == 0
%             result(i,j) = 0;
%         end
% %         if result(i,j) >180
% %             result(i,j) = 0;
% %         end
%     end
% end

subplot(2,2,1);imshow(pre);title('̮��ǰ�Ҷ�ͼ');
subplot(2,2,2);imshow(aft);title('̮����Ҷ�ͼ');
subplot(2,2,3);imshow(modified);title('̮��ǰ��ֵͼ');
subplot(2,2,4);imshow(result);title('̮�����ֵͼ');