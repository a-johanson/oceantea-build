@ECHO OFF

call start_docker4win.bat

docker pull ajohanson/oceantea-auth
docker pull ajohanson/oceantea-time-series-conversion
docker pull ajohanson/oceantea-spatial-analysis
docker pull ajohanson/oceantea-vector-time-series
docker pull ajohanson/oceantea-scalar-time-series
docker pull ajohanson/oceantea-visualization-gateway
