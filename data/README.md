# Data

## **uaap-season81-fibalivestats-shotchart-data-CLEANED.csv**
- Includes information found in the Shot Chart data of FIBA LiveStats:
    - location (origin is the center of the basket)
        - **x** - distance (10 cm/unit) from center of basket along x (horizontal) axis, right is positive
        - **y** - distance (10 cm/unit) from the center of the basket along y (vertical) axis, up is positive
    - **points** - 2 or 3
    - **made** - 1 is made, 0 is missed
    - **shot_type** - type of shot taken
    - player & team information
        - **player** - name of player
        - **num** - number of player
        - **team** - team of player
        - **opponent** - opponent team in the game
    - **date** - date when game was played
    - **venue** - where the game was played
- **Notes**
    - x and y are in 10 cm intervals. 1 unit of x or y = 10 centimeters (0.1 meters). Meaning, a point with coordinates (10, 10) is 100cm (10 * 10cm) to the right and 100 cm away from the basket.
    - Original data extracted from [FIBA LiveStats](https://www.fibalivestats.com/).
    - **CLEAN** version - corrected mistakes in names, etc.

## **spatial-analysis-shooting-philippine-basketball-pintor.gpkg**
- includes point vector layer of field goals (same as CSV above)
- includes vector layer of court 
- includes vector layer of typical court divisions (hot zones)