DIR1='G:\�о�����ѧ��ģ\��ģ����\D�Լ���\��5��\2����\program\����֡\���ж���\';
%������������Է���
%�������ϵ�����������������ˮƽpֵ��������
r11=zeros(filenum,1);
r12=zeros(filenum,1);
r21=zeros(filenum,1);
r22=zeros(filenum,1);
p11=zeros(filenum,1);
p12=zeros(filenum,1);
p21=zeros(filenum,1);
p22=zeros(filenum,1);
for k=1:filenum
    fname = strcat(DIR1, num2str(k+start1), '1.jpg');
    New1=imread(fname);
    fname = strcat(DIR1, num2str(k+start1), '2.jpg');
    New2=imread(fname);
    img544s1=imread('G:\�о�����ѧ��ģ\��ģ����\D�Լ���\��5��\2����\program\����֡\���ж���\5441.jpg');
    img544s2=imread('G:\�о�����ѧ��ģ\��ģ����\D�Լ���\��5��\2����\program\����֡\���ж���\5442.jpg');
    
    %�Զ�Ѱ��4��ͼ�������С�ߴ�
    sizeMin=zeros(4,2);
    sizeMin(1,:)=size(New1);
    sizeMin(2,:)=size(New2);
    sizeMin(3,:)=size(img544s1);
    sizeMin(4,:)=size(img544s1);
    sizeMinMin=min(sizeMin);
    
    %ƥ����С�ߴ�
    img544s2=imresize(img544s2,sizeMinMin);
    img544s1=imresize(img544s1,sizeMinMin);
    New1=imresize(New1,sizeMinMin);
    New2=imresize(New2,sizeMinMin);
    
    img544s1=im2double(img544s1);
    img544s2=im2double(img544s2);
    New1=im2double(New1);
    New2=im2double(New2);
    
%�����Ϊһά����
    aNew1=New1(:);
    a544s1=img544s1(:);
    aNew2=New2(:);
    a544s2=img544s2(:);
    
%���ϵ�����
    [r11(k),p11(k)]=corr(aNew1,a544s1);
    [r12(k),p12(k)]=corr(aNew1,a544s2);
    [r21(k),p21(k)]=corr(aNew2,a544s1);
    [r22(k),p22(k)]=corr(aNew2,a544s2);
    
end

figure(1)
subplot(2,1,1)
bar(a544s1);
title('544֡�и�ͼ1������ֱ��ͼ');
subplot(2,1,2)
bar(a544s2);
title('544֡�и�ͼ2������ֱ��ͼ');

figure(2)
bar(r11)
hold on
title('ÿһ֡�и�ͼ1��544֡�и�ͼ1����ضȽ��ͼ')
ylabel('���ϵ��')
xlabel('֡��')
% plot([0,100],[0.2,0.2],'m')

figure(3)
bar(r12)
axis([0 100 0 1])
hold on
title('ÿһ֡�и�ͼ1��544֡�и�ͼ2����ضȽ��ͼ')
ylabel('���ϵ��')
xlabel('֡��')
plot([0,100],[0.2,0.2],'m')



