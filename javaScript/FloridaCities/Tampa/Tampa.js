const Tampa = {
    city: "Tampa",
    region: "West Florida",
    country: "the United States",
    population: 396000,
    climate: "warm",
    famousPlace: "Busch Gardens",
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

export default Tampa;