const Navigation = {
   
        home: '<a href="http://127.0.0.1:5500/Homework7FloridaCities/index.html">Home</a>',
        daytonaBeach: '<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/daytonaBeach/index.html">DaytonaBeach</a>' ,
        FtLauderdale: '<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/ftLauderdale/index.html">FtLauderdale</a>',
        gainesville: '<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/Gainesville/index.html">Gainesville</a>',
        keywest:'<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/keyWest/index.html">KeyWest</a>',
        miami:'<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/Miami/index.html">Miami</a>',
        orlando:'<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/Orlando/index.html">Orlando</a>',
        palmbeach:'<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/palmBeach/index.html">PalmBeach</a>',
        tallahassee:'<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/Tallahassee/index.html">Tallahassee</a>',
        tampa:'<a href="http://127.0.0.1:5500/practiceRepository/Homework7FloridaCities/Tampa/index.html">Tampa</a>',
    newNav: function(navHome, navDaytonaBeach,navFtLauderdale,navGainesville,navKeyWest,navMiami,navOrlando,navPalmBeach,navTallahassee,navTampa) {
        this.home = navHome;
        this.daytonaBeach = navDaytonaBeach;
        this.FtLauderdale = navFtLauderdale;
        this.gainesville = navGainesville;
        this.keyWest = navKeyWest;
        this.miami = navMiami;
        this.orlando = navOrlando;
        this.palmbeach = navPalmBeach;
        this.tallahassee = navTallahassee;
        this.tampa = navTampa;
    }
}

export default Navigation;