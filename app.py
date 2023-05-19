from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route('/script', methods=['GET'])
def execute_script():
    script_arg = request.args.get('arg')
    script_output = subprocess.check_output(['./script.sh', script_arg], universal_newlines=True)
    return script_output

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)

