import ReplaceButtonText from "./ReplaceButtonText.js";

const markup = (ReplaceButtonText) => {
    return `
    <div class="footer">
    <div class="container">    
    <h1>Visit the Sunshine state today!</h1>
    <hr>

    <div class="row">
    <div class="col-lg-6"> 
    <p> </p>
    <button>${ReplaceButtonText.daytonaBeach}</button></div>
    <div class="col-lg-6">
    <p></p>
    <button>${ReplaceButtonText.FtLauderdale}</button>
    </div>
    </div>
    <br>
    <div class="row">
    <div class="col-lg-6">
    <p></p>
    <button>${ReplaceButtonText.gainesville}</button></div>
    <div class="col-lg-6">
    <p></p>
    <button>${ReplaceButtonText.keywest}</button>
    </div></div>
    <br>
    <div class="row">
    <div class="col-lg-6">
    <p></p>
    <button>${ReplaceButtonText.miami} </button>
    </div>
    <div class="col-lg-6"><p></p>
    <button>${ReplaceButtonText.orlando}</button>
    </div></div>
    <br>
    <div class="row">
    <div class="col-lg-6"><p></p>
    <button>${ReplaceButtonText.palmbeach} </button>
    </div>
    <div class="col-lg-6"><p></p>
    <button>${ReplaceButtonText.tallahassee}</button>
    </div></div>
    <br>
    <div class="row">
    <div class="col-lg-6">
    <p></p>
    <button>${ReplaceButtonText.tampa}</button>
    </div>
    <div class="col-lg-6"><p></p>
    <button> ${ReplaceButtonText.jeddah} </button>
    </div></div>
    <br>
    <div class="row">
    <div class="col-lg-6">
    <p></p>
    <button> ${ReplaceButtonText.learnVancouver}</button>
    </div>
    <div class="col-lg-6"><p></p> 
    <button>${ReplaceButtonText.learnVictoria} </button>
    </div></div>   
  
    <br>
    <p>Joseph's Proprietary Code &#169; 2022, All Rights Reserved, So Don't Steal It.</p>

    </div>
    </div>
    
 

    `
}

const footer = document.createElement("footer");
footer.innerHTML = markup(ReplaceButtonText);
document.body.appendChild(footer);