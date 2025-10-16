# 🚛 Truck Trip Clustering using DBSCAN & KMeans
## 🧭 Geospatial Analytics for Logistics Optimization

This project applies geospatial clustering algorithms (DBSCAN & KMeans) to truck trip data to uncover major logistics hubs, frequent route patterns, and potential optimization zones across the transportation network.

By analyzing origin and destination latitude-longitude coordinates, we identify natural route groupings and operational hotspots that can guide route planning, resource allocation, and delay management.

## 📂 Dataset Overview

Each record represents a single truck trip, containing GPS, trip, and supplier information.<br>

Feature	Description <br>
BookingID	Unique trip identifier <br>
Origin_Location, Destination_Location	Trip start and end points<br>
Org_lat_lon, Des_lat_lon	Latitude/longitude of origin & destination<br>
Curr_lat, Curr_lon	Real-time GPS ping coordinates<br>
trip_start_date, trip_end_date	Trip start and end timestamps<br>
Planned_ETA, actual_eta	Estimated vs actual arrival times<br>
ontime, delay	Delivery punctuality flags<br>
TRANSPORTATION_DISTANCE_IN_KM	Total distance traveled<br>
vehicleType, supplierNameCode, customerNameCode	Vehicle, supplier, and customer details<br>

## 🧹 Data Preprocessing

Removed missing or invalid latitude/longitude values.<br>

Filtered out coordinates outside the operating country’s bounds.<br>

## 🧠 Clustering Approach
🔹 KMeans Clustering

Applied to origin and destination coordinates.

Optimal k determined using the Elbow Method.

Segments the country into high-activity zones (hubs).

🔹 DBSCAN Clustering

Density-based clustering automatically identifies natural zones.

Detects irregularly shaped clusters and outlier routes.

No need to predefine the number of clusters.

## 🌍 Geospatial Visualization (Plotly)

Interactive map visualizations using Plotly:

Cluster Visualization:

Each cluster plotted with unique colors.

Comparative Map:

KMeans vs DBSCAN cluster overlays.

```
fig.update_layout(
    mapbox_style="open-street-map",
    mapbox_center={"lat": 20.5937, "lon": 78.9629},  # India center
    mapbox_zoom=4.5
)
```

## 📈 Key Insights

Identified primary logistics hubs based on dense clusters of origins and destinations.

DBSCAN effectively separated noise points (rare or erroneous GPS signals).

KMeans provided structured regional grouping for warehouse and supplier management.

Clusters with higher delays can be prioritized for route optimization or capacity planning.

## 💼 Business Impact

Enables data-driven route optimization.

Supports strategic warehouse location planning.

Improves supplier and driver performance tracking.

Highlights inefficient or rare routes for operational re-evaluation.

## 🧰 Tools & Technologies

| Category | Tools Used |
|-----------|-----------|
| Programming | Python |
| Libraries | Pandas, NumPy, Scikit-learn, Plotly |
| Algorithms | DBSCAN, KMeans |
| Visualization | Plotly Mapbox, Heatmaps, Scatterplots |

## 🏁 Conclusion

This project demonstrates how geospatial analytics and unsupervised learning can be applied to logistics data to uncover actionable insights on transportation density, route optimization, and hub identification.

Through DBSCAN and KMeans clustering, we can transform raw GPS data into meaningful operational intelligence for improving fleet efficiency and reducing delays.

✨ Developed by Mansi Sharma
📍 Data Analytics & Machine Learning Enthusiast
