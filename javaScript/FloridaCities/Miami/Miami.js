const Miami = {
    city: "Miami",
    region: "South Florida",
    country: "the United States",
    population: 454000,
    climate: "warm",
    famousFood: "stone crab",
    recommendation: true,
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

export default Miami;