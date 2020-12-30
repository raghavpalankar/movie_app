class CovidModel {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  CovidModel(
      {this.country,
      this.cases,
      this.todayCases,
      this.active,
      this.critical,
      this.deaths,
      this.recovered,
      this.todayDeaths});
}
