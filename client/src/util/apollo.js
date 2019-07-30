import { InMemoryCache } from "apollo-cache-inmemory";
import { ApolloClient } from "apollo-client";
import { HttpLink } from "apollo-link-http";
import absintheSocketLink from "./absinthe-socket-link"
import { split } from "apollo-link";
import { hasSubscription } from "@jumpn/utils-graphql";

const HTTP_URI = "http://localhost:4000";

const link = split(
  operation => hasSubscription(operation.query),
  absintheSocketLink,
  new HttpLink({ uri: HTTP_URI })
);

export const createClient = () => {
  return new ApolloClient({
    link: link,
    cache: new InMemoryCache()
  });
};
