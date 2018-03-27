# Ce code crée de longues séquences d'ADN
# Et sauvegarde des morceaux de séquence

initPatient    <- 500
nbPatients     <- 32

bases <- c('A', 'C', 'G', 'T')
longueurTotale <- 1024
longueurScan   <- 72
intervalle     <- longueurScan - 1
nbScans        <- 32

idPatient <- integer(nbPatients * nbScans)
idScan    <- integer(nbPatients * nbScans)
scanADN   <- character(nbPatients * nbScans)

for (idP in (initPatient+1):(initPatient+nbPatients)) {
    longueSeq <- paste(sample(bases, longueurTotale, replace=T), collapse='')

    for (idS in 1:nbScans) {
        debutScan <- sample(1:(longueurTotale-intervalle), 1)
        subScan   <- substr(longueSeq, debutScan, debutScan+intervalle)

        index     <- (idP - initPatient - 1) * nbScans + idS
        idPatient[index] <- idP
        idScan[index]    <- idS
        scanADN[index]   <- subScan
    }
}

df <- data.frame(idPatient, idScan, scanADN, stringsAsFactors=FALSE)
write.csv(df, file="data/sequences.csv", row.names=FALSE)

