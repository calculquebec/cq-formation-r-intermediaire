library(dplyr)

# Fonction du calcul de distance d'édition

editDistance <- function(seqA, seqB) {
    M <- nchar(seqA)
    N <- nchar(seqB)

    # Calculer toutes les paires de bases
    lesAs <- unlist(strsplit(seqA, split=""))
    lesBs <- unlist(strsplit(seqB, split=""))
    diffs <- outer(lesAs, lesBs, "!=")

    # Initialiser la matrice - algorithme dynamique
    mat <- matrix(, nrow=M+1, ncol=N+1)
    mat[,1] <- 0:M    # 1re colonne, coût de tout seqA
    mat[1,] <- 0:N    # 1re rangée, coût de tout seqB

    # Algorithme dynamique - recherche du chemin minimal
    for (k in 1:M) {
        for (l in 1:N) {
            mat[k + 1, l + 1] <- min(c(
                mat[k    , l    ] + (if (diffs[k, l]) 1 else 0),
                mat[k    , l + 1] + 1,
                mat[k + 1, l    ] + 1))
        }
    }

    return(mat[M+1, N+1])
}


# Sélectionner seulement les scans du patient 515 avec dplyr

df <- read.csv("data/sequences.csv", stringsAsFactors=FALSE)
patientDXV <- filter(df, df$idPatient == 515)
scansDXV <- patientDXV$scanADN

nbScans  <- length(scansDXV)
i_s <- numeric(nbScans * (nbScans - 1) / 2)
j_s <- numeric(nbScans * (nbScans - 1) / 2)
score <- numeric(nbScans * (nbScans - 1) / 2)


# Calculer la distance d'édition pour chaque paire de scans

index <- 1
for (i in 1:(length(scansDXV)-1)) {
    for (j in (i+1):length(scansDXV)) {
        i_s[index] <- i
        j_s[index] <- j
        score[index] <- editDistance(scansDXV[i], scansDXV[j])

        index <- index + 1
    }
}


# Trier en fonction du score (minimal) et afficher 5 résultats

res <- data.frame(i_s, j_s, score)
resTrie <- res[order(res$score),]

for (cas in 1:5) {
    print(sprintf("Cas #%i: decalage de %i", cas, resTrie$score[cas]))
    print(scansDXV[resTrie$i_s[cas]])
    print(scansDXV[resTrie$j_s[cas]])
}

