const updateMyTravelPlans = (update) => {
    let main = document.querySelector("main");
    main.innerHTML = markup(myTravelPlans);
    console.info(update);
};

const myTravelPlans = {
    name: "Joe's Vacation",
    location: "Paris",
    numberOfDays: 15,
    reason: "My cousin's wedding",
    companion: "My girlfriend",
    dateOfDeparture: {
        year: 2022,
        month: "April",
        day: 14,
    },
    activitiesPlanned: {
        first: "Make sure to join IT and coding classes... Purpose before everything!",
        forSightseeing: "Gotta visit Le Louvre, the Eiffel Tower, and many French restaurants",
        languagePractice: "I'm goona try to speak nothing but French for the whole trip",
        family: "I gotta visit some family at the wedding",
        lastly: "If I have time and if I'm not tired, I'll spend time with my girl lol"
    },
    lucky: true,
    toggleLucky: function(luckyStatus) {
        this.lucky = luckyStatus;
    },
}

export default myTravelPlans;