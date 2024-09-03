# Social Media Network Analysis Using R for #WSUCOMP7025 Hashtag

This project explores the analysis of a social media network formed by users interacting with the hashtag #WSUCOMP7025 on the Mastodon platform. The analysis was conducted using the R programming language, leveraging various libraries such as igraph, dplyr, and poweRlaw to perform network analysis, visualize connections, and derive insights into user interactions.

# Key Highlights

1. **Data Gathering and Preprocessing:** The data was collected from Mastodon using the rtoot library, focusing on toots containing the hashtag #WSUCOMP7025. The dataset was preprocessed to extract relevant information such as server origins and user activity. Key servers hosting the interactions were identified, with mastodon.social emerging as the most active server.

2. **Network Visualization:** The project visualizes the social network formed by the users interacting with the hashtag. By constructing a directed graph, the relationships between users were mapped, revealing key influencers within the network. The central node, representing the user "Ideree," was identified as having significant influence, with many connections indicating their central role in the network.

3. **Graph Analysis:** The network's structural properties were analyzed, including metrics such as graph diameter, density, and in-degree distribution. The analysis showed that the network has a diameter of 5 and a density of approximately 0.13, suggesting a moderately connected network. The in-degree distribution followed a power law, indicating that while most users have few connections, a few users are highly connected.

4. **Account Popularity and Influence:** The project also examined the popularity and influence of accounts using PageRank and in-degree metrics. The user "Ideree" not only had the highest in-degree but also the highest PageRank, underscoring their importance in the network. Other users with moderate influence were also identified, providing insights into the network's structure and dynamics.

## Conclusion

This project provides a comprehensive analysis of the social media network surrounding the #WSUCOMP7025 hashtag. By applying network analysis techniques in R, the project uncovers key influencers, visualizes network structures, and quantifies the connectivity within the network. These findings offer valuable insights into how social media interactions are structured and how influence spreads within a network.
