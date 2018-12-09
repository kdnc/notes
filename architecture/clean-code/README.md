## Clean Code practices

### List some good practices of clean code


#### Write meaningful names
- BAD code
    ```javascript
    function div(x, y) {
      const val = x / y;
      return val;
    }
    ```
- GOOD codes
    ```javascript
    function divide(dividend, divisor) {
      const quotient = dividend / divisor;
      return quotient;
    }
    ```
    ```javascript
    storage.removeEntity();
    heroDispatchers.getHeroes();
    toastService.openSnackBar(message, title);
    ```

#### Make code understandable within 5 seconds.
- BAD code
    ```javascript
    getSessions() {
      this.sessionService.getSessions().subscribe(
        sessions => {
          this.sessions = this.filteredSessions = sessions;
          this.filterComponent.clear();
        },
        error => {
          console.log('error occurred here');
          console.log('error');
        },
        () => console.log('session retrieval completed');
      )    
    }
    ```
- GOOD code
    ```javascript
    getSessions() {
      this.sessionService.getSessions()
        .subscribe(
          this.mapSessions(),
          this.logSessionsError(),
          this.showToast()
        ); 
    }
    ```

#### Explain in code, not comments. Write self describing code.
- BAD code
    ```javascript
    // Check if hero can defeat the villain
    if (
      hero.powers > villain.powers &&
      hero.energy > 10 &&
      !villain.monsterMode) {

    }
    ```
- GOOD code
    ```javascript
    if (hero.canDefeat(villain)) {

    }
    ```

#### Replace magic Strings with constants
- BAD code
    ```javascript
    resetDb() {
      this.http.post(`${api}/reset`).subscribe(() => {
        this.subject.next({
            eventType: 'EVENT_RESET',
            message: 'Reset the data'
        });
        this.toastService.activate('Reset the Data');
      });
    }
    ```
- GOOD code
    ```javascript
    const resetMsg = {
      eventType: EVENTS.reset,
      message: 'Reset the data'
    }
    resetDb() {
      this.http.post(`${api}/reset`).subscribe(() => {
        this.subject.next(resetMsg);
        this.toastService.activate('Reset the Data');
      });
    }
    ```
