const updateMyCar = (update) => {
    let main = document.querySelector("main");
    main.innerHTMAL = markup(myCar);
    console.info(update);
};

const myCar = {
    name: "Joseph's Car",
    year: 2014,
    make: "Toyota",
    model: "Corolla",
    milesDriven: {
        tripA: 5,
        tripB: 10,
        tripC: 7
    },
    passengers: {
        group: "People I know",
        driver: "Me",
        shotgun: "My Girlfriend",
        rearLeft: "MY Brother",
        rearRight: "Empty because my Brother's an annoying 3rd wheel lol"
    },
    ACOn: false,
    toggleAC: function(ACStatus) {
        this.ACOn = ACStatus;
    },
    newMilesDriven: function(distanceTripA, distanceTripB, distancetripC){
        this.distance.tripA = distanceTripA;
        this.distance.tripB = distanceTripB;
        this.distance.tripC = distancetripC;
    },
}

export default myCar;