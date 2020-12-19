SELECT
URUNKOD,
URUNAD,
KDVORAN*LISTEFIYAT AS 'KDV DAHIL SATIS FIYATI'
FROM tblUrun


SELECT isim,soyad,MAX(adet) AS 'ADET',MAX(tblSiparisDetay.toplam) AS 'TOPLAM' FROM tblSiparisDetay
  INNER JOIN tblSiparis ON tblSiparisDetay.faturaKod=tblSiparis.faturaKod
  INNER JOIN tblKullanici ON tblSiparis.kullaniciKod=tblKullanici.kullaniciKod
WHERE siparisDurumKod <> 10 AND isim LIKE 'A%' AND soyad LIKE '%AK'
GROUP BY isim,soyad,adet,tblSiparisDetay.toplam ORDER BY adet,tblSiparisDetay.toplam DESC


SELECT MAX(adet) AS 'SIPARIS ADET',urunkod,sehir,tblSiparisDetay.toplam FROM tblSiparisDetay
  INNER JOIN tblSiparis ON tblSiparisDetay.faturaKod=tblSiparis.faturaKod
  LEFT OUTER JOIN tblKullanici ON tblSiparis.kullaniciKod=tblKullanici.kullaniciKod
WHERE urunKod=3466 GROUP BY adet,urunkod,sehir,tblSiparisDetay.toplam ORDER BY tblSiparisDetay.toplam DESC


SELECT meslek,toplam FROM tblSiparis
  INNER JOIN tblKullanici ON tblSiparis.kullaniciKod=tblKullanici.kullaniciKod
  INNER JOIN tblMeslek ON tblKullanici.meslekKod=tblMeslek.meslekKod
ORDER BY toplam DESC


select urunAd from tblUrun
  INNER JOIN tblSiparisDetay ON tblUrun.urunKod=tblSiparisDetay.urunKod
  INNER JOIN tblSiparis ON tblSiparisDetay.faturaKod=tblSiparis.faturaKod
WHERE siparisDurumKod=10 GROUP BY urunAd ORDER BY urunAd ASC


SELECT urunAd,adet,siparisTarih FROM  tblUrun
  INNER JOIN tblSiparisDetay ON tblSiparisDetay.urunKod=tblUrun.urunKod
  LEFT OUTER JOIN tblSiparis ON tblSiparisDetay.faturaKod=tblSiparis.faturaKod
WHERE siparisTarih BETWEEN ('2007-02-01') AND ('2014-03-05')
ORDER BY siparisTarih DESC


SELECT kullaniciKod
      urunKod,adet
FROM Dukkan.dbo.tblSepet


SELECT DISTINCT(meslek),tblSiparis.toplam,tblSiparisDetay.toplam AS Siparisdetaytplm FROM tblSiparisDetay
  INNER JOIN tblSiparis ON tblSiparisDetay.faturaKod=tblSiparis.faturaKod
  INNER JOIN tblKullanici ON tblSiparis.kullaniciKod=tblKullanici.kullaniciKod
  LEFT OUTER  JOIN tblMeslek ON tblKullanici.meslekKod=tblMeslek.meslekKod
WHERE tblSiparisDetay.toplam=0 AND tblSiparis.toplam=0


SELECT kullaniciKod
      isim,
      soyad,
      ToplamUrun
FROM Dukkan.dbo.kisiBasiSatis

SELECT isim,
soyad,
toplamurun
from dbo.kisiBasiSatis order by ToplamUrun desc
