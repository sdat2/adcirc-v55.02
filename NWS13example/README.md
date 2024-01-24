# New NWS=13 setting

fort.22.nc file format:
 - groups:
    - Main
        - dimensions:
            - time
            - xi
            - yi
        - variables:
            - lat (yi, xi)
            - lon (yi, xi)
            - PSFC (time, yi, xi)
            - U10 (time, yi, xi)
            - V10 (time, yi, xi)
    - TCName
        - dimensions:
            - time
            - xi
            - yi
        - variables:
            - lat (time, yi, xi)
            - lon (time, yi, xi)
            - clon (time)
            - clat (time)
            - PSFC (time, yi, xi)
            - U10 (time, yi, xi)
            - V10 (time, yi, xi)