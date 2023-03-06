#' 
#' @author: Carlos Minutti Martinez <carlos.minutti@iimas.unam.mx>
#' @author: Miguel Félix Mata Rivera <mmatar@ipn.mx >
#' @author: Juan Antonio Galindo García <mcantoniog@gmail.com>
#' 
#' Resumen:
#' 
#' La contaminación atmosférica es un importante factor de riesgo medioambiental 
#' para la salud humana, y las exposiciones a corto y largo plazo están 
#' relacionadas con la mortalidad prematura y la reducción de la esperanza de vida. 
#' Por ejemplo, estudios han hallado asociaciones entre la diabetes y la exposición 
#' a partículas (PM10, PM2,5) y a contaminantes relacionados con el tráfico (NO2).
#' 
#' Por ello, es importante crear índices de la contaminación atmosférica para 
#' rastrear y cuantificar con precisión su efecto, y utilizar los Sistema de 
#' información geográfica (SIG) para identificar patrones y tendencias con el fin 
#' de orientar las intervenciones dirigidas a reducir estos riesgos.
#' 
#' Para investigar el impacto de los contaminantes ambientales, deben incluirse 
#' en el análisis múltiples contaminantes atmosféricos. Sin embargo, es importante 
#' señalar que, en la Ciudad de México, las concentraciones de estos contaminantes 
#' están correlacionadas espacialmente, por lo que un análisis estadístico que no 
#' tenga en cuenta este hecho podría dar lugar a estimaciones incorrectas de los 
#' efectos de cada contaminante. Por lo tanto, los factores de contaminantes se 
#' construyeron agrupando los contaminantes altamente correlacionados por 
#' ubicación, utilizando el análisis de componentes principales para preservar 
#' tanta información sobre los contaminantes como fuera posible, para ser 
#' utilizados en análisis posteriores.
#' 
#' Datos abiertos:
#' 
#'   Censo de Población y Vivienda 2020 (INEGI):
#'   https://www.inegi.org.mx/programas/ccpv/2020/
#' 
#'   Datos de calidad de aire de la Ciudad de México:
#'   http://www.aire.cdmx.gob.mx/default.php?opc=%27aKBhnmM=%27
#' 
#' Datos adicionales:
#' 
#'   cont_loc_mean.csv: Archivo generado por los autores, con las concentraciones 
#' medias de exposición a contaminantes atmosféricos por localidad, durante el 
#' periodo 2005-2020, generadas por Kriging y QGIS.


#   Apache License
# Version 2.0, January 2004
# http://www.apache.org/licenses/
#   
#   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
# 
# 1. Definitions.
# 
# "License" shall mean the terms and conditions for use, reproduction,
# and distribution as defined by Sections 1 through 9 of this document.
# 
# "Licensor" shall mean the copyright owner or entity authorized by
# the copyright owner that is granting the License.
# 
# "Legal Entity" shall mean the union of the acting entity and all
# other entities that control, are controlled by, or are under common
# control with that entity. For the purposes of this definition,
# "control" means (i) the power, direct or indirect, to cause the
# direction or management of such entity, whether by contract or
# otherwise, or (ii) ownership of fifty percent (50%) or more of the
# outstanding shares, or (iii) beneficial ownership of such entity.
# 
# "You" (or "Your") shall mean an individual or Legal Entity
# exercising permissions granted by this License.
# 
# "Source" form shall mean the preferred form for making modifications,
# including but not limited to software source code, documentation
# source, and configuration files.
# 
# "Object" form shall mean any form resulting from mechanical
# transformation or translation of a Source form, including but
# not limited to compiled object code, generated documentation,
# and conversions to other media types.
# 
# "Work" shall mean the work of authorship, whether in Source or
# Object form, made available under the License, as indicated by a
# copyright notice that is included in or attached to the work
# (an example is provided in the Appendix below).
# 
# "Derivative Works" shall mean any work, whether in Source or Object
# form, that is based on (or derived from) the Work and for which the
# editorial revisions, annotations, elaborations, or other modifications
# represent, as a whole, an original work of authorship. For the purposes
# of this License, Derivative Works shall not include works that remain
# separable from, or merely link (or bind by name) to the interfaces of,
# the Work and Derivative Works thereof.
# 
# "Contribution" shall mean any work of authorship, including
# the original version of the Work and any modifications or additions
# to that Work or Derivative Works thereof, that is intentionally
# submitted to Licensor for inclusion in the Work by the copyright owner
# or by an individual or Legal Entity authorized to submit on behalf of
# the copyright owner. For the purposes of this definition, "submitted"
# means any form of electronic, verbal, or written communication sent
# to the Licensor or its representatives, including but not limited to
# communication on electronic mailing lists, source code control systems,
# and issue tracking systems that are managed by, or on behalf of, the
# Licensor for the purpose of discussing and improving the Work, but
# excluding communication that is conspicuously marked or otherwise
# designated in writing by the copyright owner as "Not a Contribution."
# 
# "Contributor" shall mean Licensor and any individual or Legal Entity
# on behalf of whom a Contribution has been received by Licensor and
# subsequently incorporated within the Work.
# 
# 2. Grant of Copyright License. Subject to the terms and conditions of
# this License, each Contributor hereby grants to You a perpetual,
# worldwide, non-exclusive, no-charge, royalty-free, irrevocable
# copyright license to reproduce, prepare Derivative Works of,
# publicly display, publicly perform, sublicense, and distribute the
# Work and such Derivative Works in Source or Object form.
# 
# 3. Grant of Patent License. Subject to the terms and conditions of
# this License, each Contributor hereby grants to You a perpetual,
# worldwide, non-exclusive, no-charge, royalty-free, irrevocable
# (except as stated in this section) patent license to make, have made,
# use, offer to sell, sell, import, and otherwise transfer the Work,
# where such license applies only to those patent claims licensable
# by such Contributor that are necessarily infringed by their
# Contribution(s) alone or by combination of their Contribution(s)
# with the Work to which such Contribution(s) was submitted. If You
# institute patent litigation against any entity (including a
# cross-claim or counterclaim in a lawsuit) alleging that the Work
# or a Contribution incorporated within the Work constitutes direct
# or contributory patent infringement, then any patent licenses
# granted to You under this License for that Work shall terminate
# as of the date such litigation is filed.
# 
# 4. Redistribution. You may reproduce and distribute copies of the
# Work or Derivative Works thereof in any medium, with or without
# modifications, and in Source or Object form, provided that You
# meet the following conditions:
#   
#   (a) You must give any other recipients of the Work or
# Derivative Works a copy of this License; and
# 
# (b) You must cause any modified files to carry prominent notices
# stating that You changed the files; and
# 
# (c) You must retain, in the Source form of any Derivative Works
# that You distribute, all copyright, patent, trademark, and
# attribution notices from the Source form of the Work,
# excluding those notices that do not pertain to any part of
# the Derivative Works; and
# 
# (d) If the Work includes a "NOTICE" text file as part of its
# distribution, then any Derivative Works that You distribute must
# include a readable copy of the attribution notices contained
# within such NOTICE file, excluding those notices that do not
# pertain to any part of the Derivative Works, in at least one
# of the following places: within a NOTICE text file distributed
# as part of the Derivative Works; within the Source form or
# documentation, if provided along with the Derivative Works; or,
# within a display generated by the Derivative Works, if and
# wherever such third-party notices normally appear. The contents
# of the NOTICE file are for informational purposes only and
# do not modify the License. You may add Your own attribution
# notices within Derivative Works that You distribute, alongside
# or as an addendum to the NOTICE text from the Work, provided
# that such additional attribution notices cannot be construed
# as modifying the License.
# 
# You may add Your own copyright statement to Your modifications and
# may provide additional or different license terms and conditions
# for use, reproduction, or distribution of Your modifications, or
# for any such Derivative Works as a whole, provided Your use,
# reproduction, and distribution of the Work otherwise complies with
# the conditions stated in this License.
# 
# 5. Submission of Contributions. Unless You explicitly state otherwise,
# any Contribution intentionally submitted for inclusion in the Work
# by You to the Licensor shall be under the terms and conditions of
# this License, without any additional terms or conditions.
# Notwithstanding the above, nothing herein shall supersede or modify
# the terms of any separate license agreement you may have executed
# with Licensor regarding such Contributions.
# 
# 6. Trademarks. This License does not grant permission to use the trade
# names, trademarks, service marks, or product names of the Licensor,
# except as required for reasonable and customary use in describing the
# origin of the Work and reproducing the content of the NOTICE file.
# 
# 7. Disclaimer of Warranty. Unless required by applicable law or
# agreed to in writing, Licensor provides the Work (and each
# Contributor provides its Contributions) on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied, including, without limitation, any warranties or conditions
# of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
# PARTICULAR PURPOSE. You are solely responsible for determining the
# appropriateness of using or redistributing the Work and assume any
# risks associated with Your exercise of permissions under this License.
# 
# 8. Limitation of Liability. In no event and under no legal theory,
# whether in tort (including negligence), contract, or otherwise,
# unless required by applicable law (such as deliberate and grossly
# negligent acts) or agreed to in writing, shall any Contributor be
# liable to You for damages, including any direct, indirect, special,
# incidental, or consequential damages of any character arising as a
# result of this License or out of the use or inability to use the
# Work (including but not limited to damages for loss of goodwill,
#       work stoppage, computer failure or malfunction, or any and all
#       other commercial damages or losses), even if such Contributor
# has been advised of the possibility of such damages.
# 
# 9. Accepting Warranty or Additional Liability. While redistributing
# the Work or Derivative Works thereof, You may choose to offer,
# and charge a fee for, acceptance of support, warranty, indemnity,
# or other liability obligations and/or rights consistent with this
# License. However, in accepting such obligations, You may act only
# on Your own behalf and on Your sole responsibility, not on behalf
# of any other Contributor, and only if You agree to indemnify,
# defend, and hold each Contributor harmless for any liability
# incurred by, or claims asserted against, such Contributor by reason
# of your accepting any such warranty or additional liability.
# 
# END OF TERMS AND CONDITIONS


rm(list=ls())
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
set.seed(3)

library(tidyverse)
library(stringr)

# Promedio de exposición de contaminantes por localidad
cont <- read_csv('cont_loc_mean.csv')

# agebs
area_ageb = read_csv('ageb-area.csv')
inegi_loc = read_csv('inegi_loc.csv')

# localidades
inegi_loc$loc_id <- with(inegi_loc, paste(ENTIDAD, MUN, LOC, sep=''))
row.names(inegi_loc) <- inegi_loc$loc_id

# área por localidad
area_ageb$loc_id <- with(area_ageb, paste(CVE_ENT, CVE_MUN, CVE_LOC, sep=''))
area <- as.data.frame(with(area_ageb, tapply(Area, loc_id, sum)))
names(area) <- 'Area'


# ID de registro 
rid <-  with(cont, paste(ENTIDAD, MUN, LOC, sep=''))
X <- cont[,4:ncol(cont)]
row.names(X) <- rid


a_id <- rid[rid %in% row.names(area)]
ine <- inegi_loc[a_id, ]

X2 <- X[a_id,]

# nombre de localidades
lnam <- c(ine['NOM_LOC'] )$NOM_LOC



normalize <- function(x, na.rm = TRUE) {
  return((x- min(x)) /(max(x)-min(x)))
}
min_x <- as.data.frame(lapply(X2, min))
max_x <- as.data.frame(lapply(X2, max))
X3 <- as.data.frame(lapply(X2, normalize))


v_samp <- str_detect(names(X3), 'mean')
X4 <- X3[,v_samp]



# Correlaciones
round(cor(X4),3)


library(psych)
pairs.panels(X4,
             smooth = TRUE,  
             scale = FALSE,
             density = TRUE, 
             ellipses = TRUE, 
             method = "spearman", 
             pch = 21,  
             lm = FALSE, 
             cor = TRUE,     
             jiggle = FALSE,   
             factor = 2,   
             hist.col = 4,    
             stars = TRUE,   
             ci = TRUE)  


library(car)
y<-rnorm(nrow(X4))
x.lm <- lm(y ~ ., data = X4)

#Variance inflation factor
vif_values <- vif(x.lm)

barplot(vif_values, main = "VIF Values", horiz = TRUE, col = "steelblue")
abline(v = 5, lwd = 3, lty = 2)
sort(vif_values)



results <- prcomp(X4, scale = FALSE)
biplot(results, scale = 0, xlabs=lnam, cex=0.7)




(X.fa <- factanal(X4, factors = 2, rotation = "varimax", lower = 0.001, nstart = 1))

plot(X.fa$loadings[,1], 
     X.fa$loadings[,2],
     xlab = "Factor 1", 
     ylab = "Factor 2", 
     ylim = c(-1.2,1.2),
     xlim = c(-1.2,1.2),
     main = "Varimax rotation")

text(X.fa$loadings[,1]-0.08, 
     X.fa$loadings[,2]+0.08,
     colnames(X4),
     col="blue")
abline(h = 0, v = 0)




# En c1, c2, c3 se guardan los pesos de cada contamiante para los 3 grupos
results2 <- prcomp(X4[c('pm10_mean', 'pm25_mean', 'co_mean')], scale = FALSE)
#summary(results2)
(c1 <- round(results2$rotation[,1]/sum(results2$rotation[,1]),2))
#summary(results2)

results3 <- prcomp(X4[c('no2_mean', 'nox_mean')], scale = FALSE)
#summary(results3)
(c2 <- round(results3$rotation[,1]/sum(results3$rotation[,1]),2))

results4 <- prcomp(X4[c('no_mean', 'o3_mean', 'so2_mean')], scale = FALSE)
#summary(results4)
(c3 <- round(results4$rotation[,1]/sum(results4$rotation[,1]),2))



# Se calculan los factores para cada localidad
PM_CO_F <- as.matrix(X4[c('pm10_mean', 'pm25_mean', 'co_mean')]) %*% as.matrix(c1)
NOX_F <- as.matrix(X4[c('no2_mean', 'nox_mean')]) %*% as.matrix(c2)
O3_SO_F <- as.matrix(X4[c('no_mean', 'o3_mean', 'so2_mean')]) %*% as.matrix(c3)

# C_F contiene los valores de cada grupo de contaminantes por localidad
C_F <- as.data.frame(cbind(PM_CO_F, NOX_F, O3_SO_F))
colnames(C_F) <- c("PM_CO", "NOX", "O3_SO")
