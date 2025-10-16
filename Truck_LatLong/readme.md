🚛 Truck Trip Clustering using DBSCAN & KMeans
🧭 Geospatial Analytics for Logistics Optimization

This project applies geospatial clustering algorithms (DBSCAN & KMeans) to truck trip data to uncover major logistics hubs, frequent route patterns, and potential optimization zones across the transportation network.

By analyzing origin and destination latitude-longitude coordinates, we identify natural route groupings and operational hotspots that can guide route planning, resource allocation, and delay management.

📂 Dataset Overview

Each record represents a single truck trip, containing GPS, trip, and supplier information.

Feature	Description
BookingID	Unique trip identifier
Origin_Location, Destination_Location	Trip start and end points
Org_lat_lon, Des_lat_lon	Latitude/longitude of origin & destination
Curr_lat, Curr_lon	Real-time GPS ping coordinates
trip_start_date, trip_end_date	Trip start and end timestamps
Planned_ETA, actual_eta	Estimated vs actual arrival times
ontime, delay	Delivery punctuality flags
TRANSPORTATION_DISTANCE_IN_KM	Total distance traveled
vehicleType, supplierNameCode, customerNameCode	Vehicle, supplier, and customer details
🧹 Data Preprocessing

Removed missing or invalid latitude/longitude values.

Filtered out coordinates outside the operating country’s bounds.

Parsed and standardized date-time columns.

Derived new metrics:

Trip Duration (from start to end)

Delay Duration

On-time Status

Haversine Distance (if not provided)

📊 Exploratory Data Analysis (EDA)

Performed analysis to understand trip distribution, behavior, and delay patterns:

Distance distribution and travel-time correlation.

Heatmap of trip frequency by weekday and hour of day.

Vehicle-type and supplier performance analysis.

Geographic density maps of trip origins and destinations.

🧠 Clustering Approach
🔹 KMeans Clustering

Applied to origin and destination coordinates.

Optimal k determined using the Elbow Method.

Segments the country into high-activity zones (hubs).

🔹 DBSCAN Clustering

Density-based clustering automatically identifies natural zones.

Detects irregularly shaped clusters and outlier routes.

No need to predefine the number of clusters.

🌍 Geospatial Visualization (Plotly)

Interactive map visualizations using Plotly:

Cluster Visualization:

Each cluster plotted with unique colors.

Centroid Visualization:

Centroids shown as black markers to highlight logistic hubs.

Heatmaps:

Weekday vs Hour analysis for trip frequency.

Comparative Map:

KMeans vs DBSCAN cluster overlays.

fig.update_layout(
    mapbox_style="open-street-map",
    mapbox_center={"lat": 20.5937, "lon": 78.9629},  # India center
    mapbox_zoom=4.5
)

📈 Key Insights

Identified primary logistics hubs based on dense clusters of origins and destinations.

DBSCAN effectively separated noise points (rare or erroneous GPS signals).

KMeans provided structured regional grouping for warehouse and supplier management.

Clusters with higher delays can be prioritized for route optimization or capacity planning.

💼 Business Impact

Enables data-driven route optimization.

Supports strategic warehouse location planning.

Improves supplier and driver performance tracking.

Highlights inefficient or rare routes for operational re-evaluation.

🧰 Tools & Technologies
Category	Tools Used
Programming	Python
Libraries	Pandas, NumPy, Scikit-learn, Plotly, Geopy
Algorithms	DBSCAN, KMeans
Visualization	Plotly Mapbox, Heatmaps, Scatterplots
🚀 Future Enhancements

⏱️ Integrate time-based clustering (temporal + spatial).

🌤️ Include traffic and weather data for delay prediction.

📊 Deploy interactive dashboard using Plotly Dash or Power BI.

🤖 Implement anomaly detection for faulty GPS or route deviation.

🧾 Project Structure
📦 Truck Trip Clustering
│
├── truck_trip.ipynb           # Main analysis and clustering notebook
├── data/
│   └── Ride Sharing Dataset.csv
├── README.md                  # Project documentation
└── assets/                    # Optional images, visuals, or map snapshots

🏁 Conclusion

This project demonstrates how geospatial analytics and unsupervised learning can be applied to logistics data to uncover actionable insights on transportation density, route optimization, and hub identification.

Through DBSCAN and KMeans clustering, we can transform raw GPS data into meaningful operational intelligence for improving fleet efficiency and reducing delays.

✨ Developed by [Your Name]
📍 Data Analytics & Machine Learning Enthusiast
