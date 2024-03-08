"use client";

import { Button } from "@/components/ui/button";
import { SpotifyApi } from "@spotify/web-api-ts-sdk";

type AsyncFunction = (...args: any[]) => Promise<any>;

type Props = {
  action: AsyncFunction;
  children: React.ReactNode;
};

export function Click({ action, children }: Props) {
  function handleClick() {
    SpotifyApi.performUserAuthorization(
      process.env.NEXT_PUBLIC_SPOTIFY_CLIENT_ID!,
      process.env.NEXT_PUBLIC_REDIRECT_TARGET!,
      ["user-read-private", "user-read-email"],
      async (accessToken) => {
        action(accessToken);
      }
    );
  }

  return <Button onClick={handleClick}>{children}</Button>;
}
