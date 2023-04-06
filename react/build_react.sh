app_name="$1-app"
if [ ! -f $app_name/package.json ]; then
    create-react-app $app_name
fi
ls -la $app_name
cd $app_name
npm start
