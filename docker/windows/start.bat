@ECHO OFF

call update.bat

REM mkdir %HOMEDRIVE%%HOMEPATH%\OceanTEA
REM mkdir %HOMEDRIVE%%HOMEPATH%\OceanTEA\scalar_ts
REM mkdir %HOMEDRIVE%%HOMEPATH%\OceanTEA\vector_ts

docker volume create --name oceantea-scalar-vol
docker volume create --name oceantea-vector-vol
docker volume create --name oceantea-bathymetry-vol

docker run -d --name="oceantea-auth-inst" -t ajohanson/oceantea-auth
docker run -d --name="oceantea-time-series-conversion-inst" -t ajohanson/oceantea-time-series-conversion
docker run -d -v oceantea-bathymetry-vol:/usr/src/app/data --name="oceantea-spatial-analysis-inst" -t ajohanson/oceantea-spatial-analysis
docker run -d -v oceantea-vector-vol:/usr/src/app/data --name="oceantea-vector-time-series-inst" -t ajohanson/oceantea-vector-time-series
docker run -d --link oceantea-time-series-conversion-inst -v oceantea-scalar-vol:/usr/src/app/data --name="oceantea-scalar-time-series-inst" -t ajohanson/oceantea-scalar-time-series
docker run -d -p 3333:3333 --link oceantea-auth-inst --link oceantea-time-series-conversion-inst --link oceantea-spatial-analysis-inst --link oceantea-vector-time-series-inst --link oceantea-scalar-time-series-inst --name="oceantea-visualization-gateway-inst" -t ajohanson/oceantea-visualization-gateway

docker start oceantea-auth-inst
docker start oceantea-time-series-conversion-inst
docker start oceantea-spatial-analysis-inst
docker start oceantea-vector-time-series-inst
docker start oceantea-scalar-time-series-inst
docker start oceantea-visualization-gateway-inst

echo "Opening http://localhost:3333 in browser..."
timeout 3
start http://localhost:3333
