<?php

namespace AppBundle\Service;

class Mailer
{
    protected $mailer;
    protected $templating;

    public function __construct(\Swift_Mailer $mailer, \Twig_Environment $templating)
    {
        $this->mailer = $mailer;
        $this->templating = $templating;
    }

    /**
     * @param $recipient
     * @param $type
     * @throws \Twig_Error_Loader
     * @throws \Twig_Error_Runtime
     * @throws \Twig_Error_Syntax
     */
    public function sendEmail($recipient, $type)
    {
        switch ($type){
            case 'Notification':
                $body = $this->templating->render('email/notification.html.twig');
                $message = (new \Swift_Message('Notification de réservation'))
                    ->setFrom('reservations@flyaround.com')
                    ->setTo($recipient)
                    ->setBody($body, 'text/html');
                $this->mailer->send($message);
                break;
            case 'Confirmation':
                $body = $this->templating->render('email/confirmation.html.twig');
                $message = (new \Swift_Message('Confirmation de réservation'))
                    ->setFrom('reservations@flyaround.com')
                    ->setTo($recipient)
                    ->setBody($body, 'text/html');
                $this->mailer->send($message);
                break;
        }
    }
}
