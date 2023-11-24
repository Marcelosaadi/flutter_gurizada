-- CreateTable
CREATE TABLE "tabelacertinho" (
    "id" SERIAL NOT NULL,
    "item" TEXT NOT NULL,
    "diretoria" TEXT NOT NULL,
    "quantidade" INTEGER NOT NULL,
    "fornecedor" TEXT NOT NULL,
    "cie" TEXT NOT NULL,
    "prazo" INTEGER NOT NULL,
    "entrgue" BOOLEAN NOT NULL,

    CONSTRAINT "tabelacertinho_pkey" PRIMARY KEY ("id")
);
