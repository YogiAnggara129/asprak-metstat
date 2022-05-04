pendidikan_terakhir = factor(rep(c(1,2,3),5))
levels(pendidikan_terakhir) = c("SMP", "SMA", "Kuliah")
tingkat_kesejahteraan = factor(sort(rbinom(15, size=3, prob = 0.5)))
levels(tingkat_kesejahteraan) = c("kurang sejahtera", "cukup sejahtera", "sejahtera", "sangat sejahtera")
pendapatan_per_bulan = round(rnorm(15, mean=3*10^6, sd=0.5*10^6), -4)
pembelian_rata2_per_bulan = round(0.08*pendapatan_per_bulan + 30*10^3*rnorm(15), -3)

jenis_kelamin = factor(c(1,0,0,1,0,1,1,1,0,1,1,0,1,0,0))
levels(jenis_kelamin) = c("perempuan", "laki-laki")
nama_lengkap = c("Muhammad Bustomi", "Rinjani Putri S", "Salsabila Meidita",
         "Faqihudin", "Meisha Siregar", "Raffi Ahmad", "Arief Muhammad", 
         "Tukul Arwana", "Rani Mutia", "Ahmad Badarudin", "Hidayatullah",
         "Annisa Nur", "Ragil Ranituta", "Putri Afifah", "Inayah")

df = data.frame(nama_lengkap, jenis_kelamin, pendidikan_terakhir, tingkat_kesejahteraan, pendapatan_per_bulan, pembelian_rata2_per_bulan)
set.seed(42)
rows <- sample(nrow(df))
df = df[rows,]
View(df)
# write.csv(df, "survey_pelanggan.csv", row.names=FALSE)

plot(pendapatan_per_bulan, pembelian_rata2_per_bulan)
model = lm(pembelian_rata2_per_bulan ~ pendapatan_per_bulan)
summary(model)
model$residuals
