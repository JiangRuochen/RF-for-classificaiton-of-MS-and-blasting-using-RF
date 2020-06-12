function hht_2d(imf,fs)
%HHT_2D 画出希尔伯特黄变换的二维时频图
%   imf为emd分解结果
%   fs为采样频率
     [A,fh,th] = hhspectrum(imf);
     [im,tt] =toimage(A,fh,th);
     %disp_hhs(im,tt);
     ts=1/fs;
     figure;
     fff=linspace(0,0.5*fs,400);
     %%%%画图
     %surf(im);shading flat
     %pcolor(tt*ts,fff,im);shading interp
     contour(tt*ts,fff,im,'Fill','on');shading interp
     %imagesc(tt*ts,[0,0.5*fs],im);shading flat
     %%%%
     axis tight;
     ylabel('frequency/Hz')
     set(gca,'YDir','normal')
     xlabel('time/s')
     title('Hilbert-Huang spectrum');colorbar;
colormap jet

end

