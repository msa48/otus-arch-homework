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
  } else if (r < 0.3) {
    res = http.get('http://arch.homework/otusapp/safonov_mv/weatherforecast');
  } else if (r < 0.95) {
    res = http.get('http://arch.homework/otusapp/safonov_mv/api/users/1');
  //} else if (r < 0.95) {
    //res = http.get('http://arch.homework/otusapp/safonov_mv/api/users/12');
  } else {
    res = http.get('http://arch.homework/otusapp/safonov_mv/metrics');
  }

  check(res, {
    'is status 200': (r) => r.status === 200 || r.status === 201,
  });

  sleep(1);
}
