import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
    vus: 10,
    duration: '30s',
  };

export default function () {

  var res;

  var r = Math.random();

  if (r < 0.2) {
    res = http.get('http://arch.homework/otusapp/safonov_mv/api/users');
  } else if (r < 0.25) {
    res = http.get('http://arch.homework/otusapp/safonov_mv/weatherforecast');
  } else if (r < 0.35) {
      var id =  (Math.random() * 50000) | 0
      res = http.get('http://arch.homework/otusapp/safonov_mv/api/users/' + id);
  } else if (r < 0.5) {
    var id =  (Math.random() * 50000) | 0
    res = http.del('http://arch.homework/otusapp/safonov_mv/api/users/' + id);
  } else {
      var name = makeid(5);
      var obj = {
        "username": name,
        "email": name + "@relay.local",
      }

      var payload = JSON.stringify(obj);
      var params = {
          headers: {
              'Content-Type': 'application/json'
          }
      }
      res = http.post('http://arch.homework/otusapp/safonov_mv/api/users', payload, params);
  }

  check(res, {
    'is status success': (r) => r.status >= 200 && r.status < 300,
  });

  sleep(1);
}


function makeid(length) {
    var result           = '';
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * 
 charactersLength));
   }
   return result;
}