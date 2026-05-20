function [ data_back]= slidingwindow(dat, win, timepoints, overlaping )
%划分时间窗口
% dat= 输入的矩阵。每个被试是一个二维矩阵；
%win= 窗口的大小， 几个TR
% timepoints= 时间序列的时间点，TR的总个数
% overlaping = 重叠的比率。步长step=（1- overlaping ）* wind
% 输出 data_slide 划分的窗口
% 例如：  [data_slide]= slidingwindow(a_all_ROI,  50, 267,  0.8)
[row, length]=size(dat);
for i=1:row
 
     a=dat{i,1};
     aa=a;
     % aa=a;
      data=aa ;
      windo=win;
      overlap= overlaping;

                    [nobs, nvar] = size(data);
                    step=ceil(windo-overlap*windo); % 10% overlap
                    % step=ceil((1-overlap)*window); % 10% overlap
                    if ~step||step<0
                        error('you must reset overlap size!');
                    end


                    if windo>nobs
                       fprintf('There are only %d time points < window size = %d', nobs, windo)
                       error('you must reset window size!');
                    end

                    if windo==nobs
                        slides=1;
                    else
                        slides=floor((nobs-windo)/step)+1;
                    end

                    %sliding window 
                    t1=0;
                    for k=1:slides
                        t1=t1+step;
                        t2=t1+windo-1; 
                              if (t2  > timepoints)
                                 data_slide{k,1} = data(t1: timepoints,:) ;
                              else
                                    disp([t1 t2]);
                                    data_slide{k,1} = data(t1:t2,:) ;
                              end
                    end
               data_back{i,1}=data_slide
end