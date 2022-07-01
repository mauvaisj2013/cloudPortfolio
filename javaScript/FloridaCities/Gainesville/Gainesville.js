const Gainesville = {
    city: "Gainesville",
    region: "Central Florida",
    country: "the United States",
    population: 134000,
    climate: "sunny",
    famousPlace: "urban forest",
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

export default Gainesville;