const PalmBeach = {
    city: "PalmBeach",
    region: "South Florida",
    country: "the United States",
    population: 454000,
    climate: "warm",
    famousPlace: "Flagler Museum",
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

export default PalmBeach;