const daytonaBeach = {
    city: "Daytona Beach",
    region: "Central Florida",
    country: "the United States",
    population: 68700,
    climate: "warm",
    famousThing: "the Daytona 500",
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

export default daytonaBeach;