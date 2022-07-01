import myTravelPlans from "./mytravelplans.js";

const markup = (myTravelPlans) => {
    return `
    <div>
        <h3>${myTravelPlans.name}</h3>
        <ul>
        <li>Destination:${myTravelPlans.location}</li>
        <li>Number of Days:${myTravelPlans.numberOfDays}</li>
        <li>Why am I going?:${myTravelPlans.reason}</li>
        <li>Who's coming with me?:${myTravelPlans.companion}</li>
        <li>Year of the trip?:${myTravelPlans.dateOfDeparture.year}</li>
        <li>Month of the departure?:${myTravelPlans.dateOfDeparture.month}</li>
        <li>Will I get laid?:${myTravelPlans.lucky ? "Hopefully!" : "Hell naw"}</li>
        <li>Day that I'm leaving?:${myTravelPlans.dateOfDeparture.day}</li>
        <li>Things I HAVE to do:${myTravelPlans.activitiesPlanned.first}</li>
        <li>Places that I want to visit:${myTravelPlans.activitiesPlanned.forSightseeing}</li>
        <li>The goal is to not speak English:${myTravelPlans.activitiesPlanned.languagePractice}</li>
        <li>Who I'm meeting up with:${myTravelPlans.activitiesPlanned.family}</li>
        <li>Anything I'm forgetting? Oh, yeah!:${myTravelPlans.activitiesPlanned.lastly}</li>
        </ul>
        <img src="images/francehot.jpg" />
    <div>     `
}

const main = document.createElement("main");
main.innerHTML = markup(myTravelPlans);
document.body.appendChild(main);