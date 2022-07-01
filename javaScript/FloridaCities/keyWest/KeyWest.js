const KeyWest = {
    city: "KeyWest",
    region: "South Florida",
    country: "the United States",
    population: 24000,
    climate: "hot",
    famousFood: "spiny lobster",
    recommendation: false,
    image: "<img src='./images/scenery.jpg' />",
    toggleWouldRecommend: function(myRecommendation){
        this.recommendation = myRecommendation;
    },
    newFacts: function(cityFact,regionFact,countryFact,populationFact,climateFact,famousFoodFact,imagePart) {
        this.city = cityFact;
        this.region = regionFact;
        this.country = countryFact;
        this.population = populationFact;
        this.climate = climateFact;
        this.famousFood = famousFoodFact;
        this.image = imagePart;
    },
}

export default KeyWest;