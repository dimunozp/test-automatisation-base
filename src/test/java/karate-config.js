function() {
  var config = {
	baseUrl: 'http://bp-se-test-cabcd9b246a5.herokuapp.com/dimunozp/api/characters',
  }
  karate.configure('ssl', true);
  return config;
}
