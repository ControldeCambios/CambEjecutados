INSERT INTO FITBANK.TCODIGOSPROCESARID (CCODIGOPROCESAR, CSUBSISTEMA) VALUES ('RELEASE_PAWN_TERMS', '05');
INSERT INTO FITBANK.TCODIGOSPROCESAR (CIDIOMA, CCODIGOPROCESAR, CSUBSISTEMA, FHASTA, FDESDE, DESCRIPCION, VERSIONCONTROL) VALUES ('ES', 'RELEASE_PAWN_TERMS', '05', TIMESTAMP '2999-12-31 00:00:00', TIMESTAMP '2015-06-03 16:46:14', 'Liberaci�n de Pignoraciones', 0);
INSERT INTO FITBANK.TSUBSISTEMAEVENTOSID (CEVENTO, CSUBSISTEMA, CPERSONA_COMPANIA) VALUES ('RELEASE_PAWN_TERMS', '05', 2);
INSERT INTO FITBANK.TSUBSISTEMAEVENTOS (CEVENTO, CSUBSISTEMA, CPERSONA_COMPANIA, CIDIOMA, FHASTA, VERSIONCONTROL, FDESDE, DESCRIPCION) VALUES ('RELEASE_PAWN_TERMS', '05', 2, 'ES', TIMESTAMP '2999-12-31 00:00:00', 0, TIMESTAMP '2015-06-05 17:31:32', 'LIBERACION DE PIGNORACI�N');
INSERT INTO FITBANK.TSUBSISTEMAEVENTOSTRANSACCION (CEVENTO, CSUBSISTEMA, CPERSONA_COMPANIA, FHASTA, FDESDE, CSUBSISTEMA_TRANSACCION, CTRANSACCION, VERSIONTRANSACCION, RUBRO, VERSIONCONTROL) VALUES ('RELEASE_PAWN_TERMS', '05', 2, TIMESTAMP '2999-12-31 00:00:00', TIMESTAMP '2015-06-05 16:46:41', '05', '6046', '01', 1, 0);
INSERT INTO FITBANK.TCOMANDOSID (COMANDO, TIPOCOMANDO) VALUES ('com.fitbank.term.batch.auxiliar.ReleasePawnTerms', 'BCH');
INSERT INTO FITBANK.TCOMANDOSID (COMANDO, TIPOCOMANDO) VALUES ('com.fitbank.term.batch.process.acco.ReleasePawnTerms', 'BCH');
INSERT INTO FITBANK.TSUBSISTEMAPROCESOS (CPERSONA_COMPANIA, CSUBSISTEMA, CSUBSISTEMA_TRANSACCION, CTRANSACCION, VERSIONTRANSACCION, COMANDO, TIPOCOMANDO, FHASTA, FDESDE, ORDENPROCESO, LLENATABLATEMPORAL, EJECUTAFECHAPROXIMA, ACTIVO, VERSIONCONTROL) VALUES (2, '05', '01', '2000', '01', 'com.fitbank.term.batch.auxiliar.ReleasePawnTerms', 'BCH', fncfhasta, sysdate, 11, '1', '0', '1', 0);
INSERT INTO FITBANK.TSUBSISTEMAPROCESOS (CPERSONA_COMPANIA, CSUBSISTEMA, CSUBSISTEMA_TRANSACCION, CTRANSACCION, VERSIONTRANSACCION, COMANDO, TIPOCOMANDO, FHASTA, FDESDE, ORDENPROCESO, LLENATABLATEMPORAL, EJECUTAFECHAPROXIMA, ACTIVO, VERSIONCONTROL) VALUES (2, '05', '01', '2000', '01', 'com.fitbank.term.batch.process.acco.ReleasePawnTerms', 'BCH', fncfhasta, sysdate, 21, '0', '0', '1', 0);