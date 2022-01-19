%resmimizi okuyarak değişkene atıyoruz.
ornek_resim = imread("image1.jpg");
%tüm çıktıların aynı olması için resmimizi yeniden boyutlandırıyoruz.
ornek_resim = imresize(ornek_resim,[250 nan]);

%görüntüdeki yüzü algılayacak algılayıcı tanımlanıyor.Parantez içine
%"nose","mouth","UpperBody" yazabilirsiniz boş bırakırsanız yüz dedect
%eder.
algilayici = vision.CascadeObjectDetector();

% görüntüdeki yüzün hangi koordinatlarda olduğunu değişkene atıyoruz.
yuz_koordinat = step(algilayici,ornek_resim);

%resimdeki yüzü dikdörtgen içine alarak altına tanımını yazıyoruz. 
ornek_resim = insertObjectAnnotation(ornek_resim,"rectangle",yuz_koordinat,"face");

figure;
%resmi ekrana basıyoruz.
imshow(ornek_resim);