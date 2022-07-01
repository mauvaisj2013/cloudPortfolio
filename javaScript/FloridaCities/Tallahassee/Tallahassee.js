const Tallahassee = {
    city: "Tallahassee",
    region: "North Florida",
    country: "the United States",
    population: 454000,
    climate: "so-so",
    famousPlace: "Tallahasse Capitol Building",
    recommendation: true,
    image: "<img src='./images/scenery.jpg' />",
    toggleWouldRecommend: function(myRecommendation){
        this.recommendation = myRecommendation;
    },
    newFacts: function(cityFact,regionFact,countryFact,populationFact,climateFact,famousPlaceFact,imagePart) {
        this.city = cityFact;
        this.region = regionFact;
        this.country = countryFact;
        this.population = populationFact;
        this.climate = climateFact;
        this.famousPlace = famousPlaceFact;
        this.image = imagePart;
    },
}

export default Tallahassee;