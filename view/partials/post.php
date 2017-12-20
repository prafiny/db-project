<?php
namespace View\Partials\Post;

function post($post, $html_classes="") {
?>
                    <div class="post inner-block partial <?php echo $html_classes; ?>">
                        <div class="post-avatar">
                            <a href="user.php?username=<?php echo htmlspecialchars($post->author->username); ?>">
                                <img class="email-avatar" src="<?php
    $avatar = empty($post->author->avatar) ? '/images/default.jpg' : $post->author->avatar;
    echo htmlspecialchars($avatar); 
                                ?>" height="64" width="64">
                            </a>
                        </div>

                        <div class="post-content" onclick="document.location.href = 'post.php?id=<?php echo htmlspecialchars($post->id); ?>'; return false">
                            <div class="post-author">
                                <a class="link-author" href="user.php?username=<?php echo htmlspecialchars($post->author->username); ?>">
                                    <?php echo htmlspecialchars($post->author->name); ?> (<?php echo htmlspecialchars($post->author->username); ?>)
                                </a>
                            </div>
                            <span class="link-post">
                                <div class="text"><?php
    $p = htmlspecialchars($post->text);
    $p = \Model\Post\parse_mentions($p);
    $p = \Model\Post\parse_hashtags($p);
    echo $p;
?></div>
                            </span>
                        </div>

                    </div>
<?php
}
?>
